//
//  APIManager.swift
//  RetoHack
//
//  Created by Alejandro Hernandez on 25/08/19.
//  Copyright © 2019 Alejandro Hernandez. All rights reserved.
//

import Foundation
import Alamofire

let baseURLDefault = "https://us-central1-aesthetic-joy-250904.cloudfunctions.net/"

@objc class APIManager : NSObject {
    
    // MARK: - Properties
    
    @objc static let shared = APIManager(baseURL: URL(string: baseURLDefault)!)
    
    // MARK: -
    
    let baseURL: URL
    
    // Initialization
    
    private init(baseURL: URL) {
        self.baseURL = baseURL
   
    }
    
    
   @objc public func getVentasTotales(completion: @escaping (_ error : NSError?, _ suma : NSNumber?) -> Void){
        Alamofire.request(baseURLDefault + "ventas_totales", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in

            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: NSNumber] {
                    let result = json["total"]

                    
                    completion(nil, result!)
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }

            
        }
        
    }
    
    @objc public func getIvaTotal(completion: @escaping (_ error : NSError?, _ suma : NSNumber?) -> Void){
        Alamofire.request(baseURLDefault + "ventas_totales", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: NSNumber] {
                    let result = json["iva"]
                    
                    
                    completion(nil, result!)
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
        
    }
    
    @objc public func getGastosTotales(completion: @escaping (_ error : NSError?, _ suma : NSNumber?) -> Void){
        Alamofire.request(baseURLDefault + "gastos_totales", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: NSNumber] {
                    let result = json["total"]
                    
                    
                    completion(nil, result!)
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
        
    }
    
    @objc public func getUtilidadTotales(completion: @escaping (_ error : NSError?, _ suma : NSNumber?) -> Void){
        Alamofire.request(baseURLDefault + "utilidad_total", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: NSNumber] {
                    let result = json["total"]
                    
                    
                    completion(nil, result!)
                    
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
        
    }
    
    @objc public func getProveedoresPorPeriodo(completion: @escaping (_ error : NSError?, _ suma : NSNumber?) -> Void){
        Alamofire.request(baseURLDefault + "proveedores-periodo", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            print(response.description)
            do {
                
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    response.data!, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray)
                completion(nil, jsonArray[0]["COUNT(emisorrfc)"] as! NSNumber)
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
    }
    
    @objc public func getUtilidadTotal(completion: @escaping (_ error : NSError?, _ suma : NSNumber?) -> Void){
        Alamofire.request(baseURLDefault + "utilidad_total", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                if let json = try JSONSerialization.jsonObject(with: response.data!, options: []) as? [String: NSNumber] {
                    let result = json["total"]
                    
                    
                    completion(nil, result!)
                    
                }
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
    }
    
    @objc public func getMayorGasto(completion: @escaping (_ error : NSError?, _ suma : NSNumber?, _ name : NSString?) -> Void){
        Alamofire.request(baseURLDefault + "mayor-gasto", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    response.data!, options: [])
                    //let result = json["total"]
                    
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                print(jsonArray)
                
                completion(nil, jsonArray[0]["total"] as! NSNumber,jsonArray[0]["emisorname"] as! NSString )
                    
                }
                
             catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil, nil)
            }
            
    
        }
    }
    
    @objc public func getVentasTop(completion: @escaping (_ error : NSError?, _ clientesTop : NSArray?) -> Void){
        Alamofire.request(baseURLDefault + "ventas_top10", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    response.data!, options: [])
                //let result = json["total"]
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
    
                completion(nil,jsonArray as NSArray)
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
    }
    
    @objc public func getVentasPorPeriodo(completion: @escaping (_ error : NSError?, _ ventas : NSArray?) -> Void){
        Alamofire.request(baseURLDefault + "ventas_periodo", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    response.data!, options: [])
                //let result = json["total"]
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                
                completion(nil,jsonArray as NSArray)
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
    }
    
    @objc public func getGastosPorPeriodo(completion: @escaping (_ error : NSError?, _ ventas : NSArray?) -> Void){
        Alamofire.request(baseURLDefault + "gastos_periodo", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    response.data!, options: [])
                //let result = json["total"]
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                
                completion(nil,jsonArray as NSArray)
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
    }
    
    @objc public func getComprasTop(completion: @escaping (_ error : NSError?, _ ventas : NSArray?) -> Void){
        Alamofire.request(baseURLDefault + "compras_top10_vista_tabla", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    response.data!, options: [])
                //let result = json["total"]
                
                guard let jsonArray = jsonResponse as? [[String: Any]] else {
                    return
                }
                
                completion(nil,jsonArray as NSArray)
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
    }
    
    @objc public func getProveedorMasGrande(completion: @escaping (_ error : NSError?, _ ventas : NSString?) -> Void){
        Alamofire.request(baseURLDefault + "proveedor_mas_grande", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            print(response.description)
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with:
                    response.data!, options: [])
                //let result = json["total"]
                
               let jsonArray = jsonResponse as? [[String: Any]]
                
                completion(nil,jsonArray![0]["emisorname"] as! NSString)
                
            } catch let error as NSError {
                print("Failed to load: \(error.localizedDescription)")
                completion(error,nil)
            }
            
            
        }
    }
    
}
