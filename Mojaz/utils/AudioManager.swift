//
//  AudioManagerViewController.swift
//  ChatRecorder
//
//  Created by abuzeid on 9/17/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import UIKit
import AVFoundation


class AudioManager: NSObject {
    
    fileprivate var recordingSession: AVAudioSession!
    public var audioRecorder: AVAudioRecorder!
    public var soundPlayer:AVAudioPlayer!
    func timeFormat(interval:TimeInterval)->String{
        let t = Int(interval)
        var sec = t
        if sec > 60{
            sec = t % 60
        }
        return String(format: "%02d:%02d", (t / 60), sec)
    }
    
    
}

//audio player

extension AudioManager:AVAudioPlayerDelegate{
    
    public  func playSound(u:URL) {
        
        let url  = u
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            soundPlayer = try AVAudioPlayer(contentsOf: url)
            guard let pl = soundPlayer else { return }
            
            pl.play()
        } catch let _ {
            print("can't intialize player \(u.absoluteString)")
            ZToast.alert(message: "File not valid")
            //print(error)
        }
    }
    func stop() {
        guard  let player = soundPlayer else {
            return;
        }
        player.stop()
        
    }
    
    
    
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        print("AUDIO PLAYER audioPlayerDidFinishPlaying \(String(flag))")
        
    }
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, error: Error?) {
        print("AUDIO PLAYER ERROR \(String(describing: error?.localizedDescription))")
    }
    
    
    
    
}


//recorder

extension AudioManager:AVAudioRecorderDelegate{
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if !flag {
            finishRecording(success: false)
        }
    }
    
    public func initRecorder(){
        recordingSession = AVAudioSession.sharedInstance()
        
        do {
            try recordingSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try recordingSession.setActive(true)
            recordingSession.requestRecordPermission() { [unowned self] allowed in
                DispatchQueue.main.async {
                    if allowed {
                        //self.recordingState = "permission: user accept recording"
                    } else {
                        // self.recordingState = "permission: user refuse recording"
                    }
                }
            }
        } catch {
            // failed to record!
        }
        
        
        
    }
    
    
    
    public func startRecording()->URL? {
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent("\(Date())_recording.m4a")
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
            audioRecorder.delegate = self
            audioRecorder.record()
            return audioFilename
            //            recordButton.setTitle("Tap to Stop", for: .normal)
        } catch {
            finishRecording(success: false)
        }
        
        return nil
        
    }
    
    public func finishRecording(success: Bool) {
        audioRecorder.stop()
        audioRecorder = nil
        
        if success {
            //            recordButton.setTitle("Tap to Re-record", for: .normal)
        } else {
            //            recordButton.setTitle("Tap to Record", for: .normal)
            // recording failed :(
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    
    
    func updateUi(sender:Any){
        guard let recorder = audioRecorder else {
            print("recorder is null")
            
            
            return;
        }
        
        let t = Int(recorder.currentTime)
        print("time\(t)")
        var sec = t
        if sec > 60{
            sec = t % 60
        }
        let timeString = String(format: "%02d:%02d", (t / 60), sec)
        
        print("update time")
        // self.statelbl.text =  timeString
        
    }
    
    //    let recorderTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateUi), userInfo: nil, repeats: true)
    
    
    
    
}
