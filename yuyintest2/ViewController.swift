//
//  ViewController.swift
//  yuyintest2
//
//  Created by 麦俊杰 on 2021/2/7.
//

import UIKit
import Speech


class ViewController: UIViewController, SFSpeechRecognizerDelegate{

    @IBOutlet weak var textView: UITextView!
    private let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: "zh-CN"))  //中文
    
    private var recognitionRequest: SFSpeechAudioBufferRecognitionRequest?
    private var recognitionTask: SFSpeechRecognitionTask?
    private let audioEngine = AVAudioEngine()
    
    @IBAction func yyb(_ sender: Any) {
        print("语音识别按钮1")
        if audioEngine.isRunning {
            audioEngine.stop()
            recognitionRequest?.endAudio()
            yybO.isEnabled = false
            yybO.setTitle("开始录音", for: .normal)
        } else {
            startRecording()
            yybO.setTitle("Stop Recording", for: .normal)
        }
    }
    
    @IBOutlet weak var yybO: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yybO.isEnabled = false
        speechRecognizer?.delegate = self
        SFSpeechRecognizer.requestAuthorization{ (authStatus) in
                var isButtonEnabled = false
            switch authStatus{
            case .authorized:
                isButtonEnabled = true
            case .denied:
                isButtonEnabled = false
            case .notDetermined:
                isButtonEnabled = false
            case .restricted:
                isButtonEnabled = false
            
            }
            
            OperationQueue.main.addOperation {
                self.yybO.isEnabled = isButtonEnabled
            }
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    
    
    func startRecording() {
        
        if recognitionTask != nil {
            recognitionTask?.cancel()
            recognitionTask = nil
        }
        
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(AVAudioSession.Category.record)
            try audioSession.setMode(AVAudioSession.Mode.measurement)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)
        } catch {
            print("audioSession properties weren't set because of an error.")
        }
        
        recognitionRequest = SFSpeechAudioBufferRecognitionRequest()//实例化识别请求
        
        //检查audioengine，检查手机硬件是否支持录音。模拟器无法调用mac电脑麦克风，需要使用iPhone实机调试
        guard let inputNode :AVAudioInputNode? = audioEngine.inputNode else {
            fatalError("Audio engine has no input node")
        }
        //检测是否正常实例speech kit识别请求类
        guard let recognitionRequest = recognitionRequest else {
            fatalError("Unable to create an SFSpeechAudioBufferRecognitionRequest object")
        }
        //让识别请求是听多少识别多少，而非等到录音完成才识别，赋值true
        recognitionRequest.shouldReportPartialResults = false
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            
            var isFinal = false
            
            if result != nil {
                
                self.textView.text = result?.bestTranscription.formattedString
                let jieguo = result?.bestTranscription.formattedString
                print(jieguo)
                isFinal = (result?.isFinal)!
            }
            
            if error != nil || isFinal {
                self.audioEngine.stop()
                inputNode?.removeTap(onBus: 0)
                
                self.recognitionRequest = nil
                self.recognitionTask = nil
                
                self.yybO.isEnabled = true
            }
        })
        
        let recordingFormat = inputNode?.outputFormat(forBus: 0)
        inputNode?.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { (buffer, when) in
            self.recognitionRequest?.append(buffer)
        }
        
        audioEngine.prepare()
        
        do {
            try audioEngine.start()
        } catch {
            print("audioEngine couldn't start because of an error.")
        }
        
        textView.text = "Say something, I'm listening!"
        
    }
    
    func speechRecognizer(_ speechRecognizer: SFSpeechRecognizer, availabilityDidChange available: Bool) {
        if available {
            yybO.isEnabled = true
        }else {
            yybO.isEnabled = false
        }
    }
    

}

