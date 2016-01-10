//
//  VistaResumen.swift
//  PizzaProvider
//
//  Created by Fernando Renteria on 10/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import UIKit

class VistaResumen: UIViewController {
    
    var step5Size: String = ""
    var step5Base: String = ""
    var step5Cheese: String = ""
    var step5Ingredientes: [String] = []

    @IBOutlet weak var resumenPedido: UILabel!
    
    func descripcion()->String {
        var resumen: String = ""
        resumen = "Tamaño: \(step5Size)\nMasa: \(step5Base)\nQueso: \(step5Cheese)\nIngredientes:\n"
        if (step5Ingredientes.count > 0) {
            for item in step5Ingredientes {
                let ingrediente: String = String(item)
                resumen = resumen.stringByAppendingString("\t \(ingrediente) \n")
            }
        }
        return resumen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resumenPedido.text = descripcion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject!) -> Bool {
        if identifier == "confirmarPedido" {

            if (step5Size.isEmpty || step5Base.isEmpty ||  step5Cheese.isEmpty || step5Ingredientes.isEmpty) {
                let alert = UIAlertController(title: "Oops!", message:"Favor de completar el pedido.", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Okay.", style: .Default) { _ in })
                self.presentViewController(alert, animated: true){}
                return false
            }
            else {
                return true
            }
        }
        
        // by default, transition
        return true
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "resumenTam") {
            let vistaTamanio = segue.destinationViewController as! ViewController
            vistaTamanio.step1Base = step5Base
            vistaTamanio.step1Size = step5Size
            vistaTamanio.step1Cheese = step5Cheese
            vistaTamanio.step1Ingredientes = step5Ingredientes
        }
        if (segue.identifier == "confirmarPedido") {
            //let vistaTamanio = segue.destinationViewController as! ViewController
        }
        
    }
}
