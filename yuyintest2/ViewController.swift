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
    
    @IBOutlet weak var xuenian: UITextView!
    
    @IBOutlet weak var xueqi: UITextView!
    
    
    @IBOutlet weak var requiredCode: UITextView!
    
    
    
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
    
    func hanzFou(hanzStr: String) -> Bool {
        switch hanzStr {
        case "学期":
            return true
        case "第":
            return true
        default:
            return false
        }
    }
    
    func numberFou(numStr: String) -> Bool {
        switch numStr {
        case "0":
            return true
        case "1":
            return true
        case "2":
            return true
        case "3":
            return true
        case "4":
            return true
        case "5":
            return true
        case "6":
            return true
        case "7":
            return true
        case "8":
            return true
        case "9":
            return true
        default:
            return false
        }
    }
    
    
    func indexIndentify(jieguo: String) -> Int {
        var indexnum: Int = 0
        let long2 = jieguo.count
        for ij in 0..<long2 {
            print(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij)])
            var str3: String = ""
            str3.append(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij)])
            var numberfou = false
            numberfou = numberFou(numStr: str3)
            if numberfou == true {
                print("年份起始在字符串第")
                print(indexnum)
                print("位")
                return indexnum
                //break
            }
            indexnum = indexnum + 1
        }
        indexnum = 0
        return indexnum
    }
    
    func indexIndentify2(jieguo: String) -> Int {
        var indexnum: Int = 0
        let long2 = jieguo.count
        for ij in 0..<long2 {
            print(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij)])
            var str3: String = ""
            str3.append(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij)])
            var difou = false
            difou = hanzFou(hanzStr: str3)
            if difou == true {
                print("学期起始在字符串第")
                print(indexnum+1)
                print("位")
                return indexnum + 1
                //break
            }
            indexnum = indexnum + 1
        }
        indexnum = 0
        return indexnum
    }
    
    func xueqiCatch(jieguo: String, xueqiIndex: Int) -> String {
        var indexnum: Int = 0
        let long2 = jieguo.count
        var str3: String = ""
        for ij in 0..<3 {
            let ij1 = ij + xueqiIndex
            print(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij1)])
            str3.append(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij1)])
        }
        print("所查询学期是第")
        print(str3)
        xueqi.text = str3
        return str3
    }
    
    func yearCatch(jieguo: String, erIndex: Int) -> String {
        var indexnum: Int = 0
        let long2 = jieguo.count
        var str3: String = ""
        for ij in 0..<4 {
            let ij1 = ij + erIndex
            print(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij1)])
            str3.append(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij1)])
        }
        print("所查询学年第")
        xuenian.text = str3
        print(str3)
        return str3
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
        //让识别请求是听多少识别多少，而非等到录音完成才识别，赋值true。 false为录音完毕才进行识别
        recognitionRequest.shouldReportPartialResults = false
        
        recognitionTask = speechRecognizer?.recognitionTask(with: recognitionRequest, resultHandler: { (result, error) in
            
            var isFinal = false
            
            if result != nil {
                
                self.textView.text = result?.bestTranscription.formattedString
                let jieguo = result?.bestTranscription.formattedString
                print(jieguo)
                //self.indexIndentify(jieguo: jieguo!)
                let index22 = self.indexIndentify(jieguo: jieguo!)
                //print(index22)
                //self.yearCatch(jieguo: jieguo!, erIndex: index22)//提取出需要查询的学年
                let str4 = self.yearCatch(jieguo: jieguo!, erIndex: index22)
                let index33 = self.indexIndentify2(jieguo: jieguo!)
                print(index33)
                //self.xueqiCatch(jieguo: jieguo!, xueqiIndex: index33)
                let str5 = self.xueqiCatch(jieguo: jieguo!, xueqiIndex: index33)
                var str6: String = ""
                var str7: String = ""
                switch str5 {
                case "一学期":
                    str6 = "01"
                case "二学期":
                    str6 = "02"
                default:
                    str6 = ""
                }
                //str3.append(jieguo[jieguo.index(jieguo.startIndex, offsetBy: ij1)])
                str7 = str4
                str7.append(str6)
                self.requiredCode.text = str7
                
                
                
                
                
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

