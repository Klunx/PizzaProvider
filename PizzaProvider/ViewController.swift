//
//  ViewController.swift
//  PizzaProvider
//
//  Created by Fernando Renteria on 10/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Variables.
    var step1Size: String = ""
    var step1Base: String = ""
    var step1Cheese: String = ""
    var step1Ingredientes: [String] = []

    @IBOutlet weak var descripcionPedido: UILabel!
    
    /**
    * Agregar el tamaño de la pizza por medio del nombre del
    * botón.
    */
    @IBAction func agregarTamanioPizza(sender: UIButton) {
        step1Size = sender.currentTitle!
        descripcionPedido.text = mensajePizza()
    }

    /**
     * Impresión del estado de la pizza.
     */
    func mensajePizza()->String{
        var tamanioPedido: String = ""
        if (step1Size.isEmpty) {
            tamanioPedido = "Favor de elegir un pedido"
        } else {
            tamanioPedido = "El tamaño de tu pizza es: \(step1Size)"
        }        
        return tamanioPedido
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "tamMasa") {
            let vistaMasa = segue.destinationViewController as! VistaMasa
            vistaMasa.step2Size = step1Size
            vistaMasa.step2Base = step1Base
            vistaMasa.step2Cheese = step1Cheese
            vistaMasa.step2Ingredientes = step1Ingredientes
        }
        
        if (segue.identifier == "tamQueso") {
            let vistaQueso = segue.destinationViewController as! VistaQueso
            vistaQueso.step4Size = step1Size
            vistaQueso.step4Base = step1Base
            vistaQueso.step4Cheese = step1Cheese
            vistaQueso.step4Ingredientes = step1Ingredientes
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        descripcionPedido.text = mensajePizza()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

