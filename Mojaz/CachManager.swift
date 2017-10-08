//
//  CachManager.swift
//  Mojaz
//
//  Created by abuzeid on 9/30/17.
//  Copyright © 2017 abuzeid. All rights reserved.
//

import Foundation
import Alamofire


public final class CachManager:NSObject{
    public final let maxdStackNum = 5
    // if user overs the limit delete oldest 5 videos
    final let maxNumOfCachedVideos = 10
    final let maxStorageToUse = 50 * 1024 * 1024
    private override init() {
        print("Main Storage dir-> \( documentsURL.path) ")
    }
    
    
    public static let manager = CachManager()
    let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let downloadGroup = DispatchGroup()
    var blocks: [DispatchWorkItem] = []
    
    
    
    
    public func downloadQueue(files:[String]){
        let count = files.count > maxdStackNum ? maxdStackNum : files.count
        for i in 0 ..< count  {
            let address = files[i]
            if isFileCached(url: address){
                print("cached file num \(i) of \(files.count)")
                continue
            }
            addItemToDownloadQueue(urlString:address)
        }
        
        
    }
    
    
    public func addItemToDownloadQueue(urlString:String){
        downloadGroup.enter()
        let block = DispatchWorkItem(flags: .inheritQoS) { // 3
            guard let filename = urlString.components(separatedBy: "/").last else {
                //throw CachingErrors.invalidFileName
                return
            }
            self.download(filename: filename, url: urlString, filePath: nil)
        }
        blocks.append(block)
        DispatchQueue.main.async(execute: block) // 4
        
    }
    
    
    private func download(filename:String,url:String,filePath:((String)->())?){
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let fileURL = self.documentsURL.appendingPathComponent(filename)
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        
        
        
        Alamofire.download(url, to: destination).response { response in
            print("download response.......")
            print(response)
            
            if response.error == nil, let fpath = response.destinationURL?.path {
                print(#function)
                print(url)
                if let closure  = filePath{
                    closure(fpath)
                }
                self.downloadGroup.leave()
            }else{
                print(response.error?.localizedDescription ?? "no error desc")
            }
        }
        
        
        
        
    }
    
    
    public func isFileCached(url:String)->Bool{
        
        guard let filename = url.components(separatedBy: "/").last else {
            //            debug()
            print("can't find file name")
            return false
        }
        
        
        let fileURL = documentsURL.appendingPathComponent(filename)
        var fileSize : UInt64
        
        do {
            //return [FileAttributeKey : Any]
            let attr = try FileManager.default.attributesOfItem(atPath: fileURL.path)
            fileSize = attr[FileAttributeKey.size] as! UInt64
            print("file size \(fileSize)")
            //if you convert to NSDictionary, you can get file size old way as well.
            //
            
            let dict = attr as NSDictionary
            fileSize = dict.fileSize()
            return fileSize  > 0
            
            
        } catch {
            print("Error: \(error)")
            return false
        }
        
        
        
        
        
        
    }
    
    
    
    
    public func getFile(url:String, filePath: @escaping(String)->()){
        
        guard let filename = url.components(separatedBy: "/").last else {
            //            debug()
            print("can't find file name")
            return
        }
        let fileURL = documentsURL.appendingPathComponent(filename)
        if isFileCached(url: fileURL.path){
            filePath( fileURL.path)
            
        }else{
            self.download(filename: filename, url: url, filePath: {
                path in
                filePath( path)
                
            })
            
        }
    }
    
    
    
    
    
    public func cancel(){
        for block in blocks[0 ..< blocks.count] { // 5
            let cancel = arc4random_uniform(2) // 6
            if cancel == 1 {
                block.cancel() // 7
                downloadGroup.leave() // 8
            }
        }
        
        
    }
    
    
    private  func passExcption(){
        
    }
    
    
    
    
    func clearOverWeightStorage(){
        var storage:storageObject? = getStorageFilesByOldest()
        defer {
            storage = nil
        }
        
        if  storage!.1 > maxStorageToUse{
            clearOldestFiles(array: storage!.0)
        }else{
            print("Your Storage is under control  = \(storage!)")
        }
        
        
    }
    
    private typealias filesArray = [(TimeInterval,String)]
    private  typealias  storageObject = (filesArray,UInt64)
    
    
    private func getStorageFilesByOldest()->storageObject{
        var arrayToRemove = filesArray()
        
        var sum:UInt64 = 0
        do{
           
            
            let filePaths = try  FileManager.default.contentsOfDirectory(atPath: documentsURL.path)
            print("Main Storage dir-> \( documentsURL.path)) ")
            for filePath in filePaths {
                do {
                    let attr = try FileManager.default.attributesOfItem(atPath:  documentsURL.path + "/" +  filePath)
                    let dict = attr as NSDictionary
                    sum = sum + dict.fileSize()
                    if let time = dict.fileCreationDate()?.timeIntervalSince1970{
                        arrayToRemove.append( (time,filePath))
                    }
                } catch {
                    print("Error: \(error)")
                }
            }
            
        } catch {
            print("Could not clear folder: \(error)")
        }
        arrayToRemove = arrayToRemove.sorted(by:{ $0.0 > $1.0 })
        return (arrayToRemove,sum)
        
    }
    public func getStorgeCachSize()->UInt64{
        var sum:UInt64 = 0
        do{
            let filePaths = try  FileManager.default.contentsOfDirectory(atPath: documentsURL.path)
            for filePath in filePaths {
                    let attr = try FileManager.default.attributesOfItem(atPath:  documentsURL.path + "/" +  filePath)
                    let dict = attr as NSDictionary
                    sum = sum + dict.fileSize()
            }
            
        } catch {
            print("Could not clear folder: \(error)")
        }
        return sum
        
    }
    private func clearOldestFiles(array:filesArray) {
        let fileManager = FileManager.default
        do {
            for  index in   0...(array.count - 1) {
                if getStorgeCachSize() > maxStorageToUse{
                    let lastIndex = array.count - (index + 1)
                    try fileManager.removeItem(atPath:documentsURL.path + "/" + array[lastIndex].1)
                    
                }
            }
        } catch {
            print("Could not clear  folder: \(error)")
        }
    }
    
    
    
}







//
//
//
///// Manager of asynchronous NSOperation objects
//var completionHandlers: [() -> Void] = []
//
//class DownloadManager: NSObject{
//
//    /// Dictionary of operations, keyed by the `taskIdentifier` of the `NSURLSessionTask`
//
//    private var operations = [String: completionHandlers]()
//
//    /// Serial NSOperationQueue for downloads
//
//    let queue: OperationQueue = {
//        let _queue = OperationQueue()
//        _queue.name = "download"
//        _queue.maxConcurrentOperationCount = 1
//
//        return _queue
//    }()
//
//    /// Delegate-based NSURLSession for DownloadManager
//
//
//    func addDownload(url: String) -> Any {
//        let operation = downloader.get(url: url, file: {file in })
//        operations[operation.task.taskIdentifier] = operation
//        queue.addOperation(operation)
//        return operation
//    }
//
//    /// Cancel all queue operations
//
//    func cancelAll() {
//        queue.cancelAllOperations()
//    }
//
//
//}
//






