//
//  VistaMasa.swift
//  PizzaProvider
//
//  Created by Fernando Renteria on 10/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import UIKit

class VistaMasa: UIViewController {

    var step2Size: String = ""
    var step2Base: String = ""
    var step2Cheese: String = ""
    var step2Ingredientes: [String] = []

    
    @IBOutlet weak var descripcionMasa: UILabel!
    
    @IBAction func agregarMasa(sender: UIButton) {
        step2Base = sender.currentTitle!
        descripcionMasa.text = mensajePizza()
    }
    
    /**
     * Impresión del estado de la pizza.
     */
    func mensajePizza()->String{
        var tamanioPedido: String = ""
        if (step2Base.isEmpty) {
            tamanioPedido = "Favor de elegir un tipo de masa"
        } else {
            tamanioPedido = "La masa que has elegido es: \(step2Base)"
        }
        
        return tamanioPedido
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "masaTam") {
            let vistaTamanio = segue.destinationViewController as! ViewController
            vistaTamanio.step1Base = step2Base
            vistaTamanio.step1Size = step2Size
            vistaTamanio.step1Cheese = step2Cheese
            vistaTamanio.step1Ingredientes = step2Ingredientes
        }
        
        if (segue.identifier == "masaQueso") {
            let vistaQueso = segue.destinationViewController as! VistaQueso
            vistaQueso.step4Size = step2Size
            vistaQueso.step4Base = step2Base
            vistaQueso.step4Cheese = step2Cheese
            vistaQueso.step4Ingredientes = step2Ingredientes
        }

    }
/*
    override func viewWillAppear(animated: Bool) {
        descripcionMasa.text = mensajePizza()
    }
  */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // self.navigationItem.hidesBackButton = true
        descripcionMasa.text = mensajePizza()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
