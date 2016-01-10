//
//  VistaQueso.swift
//  PizzaProvider
//
//  Created by Fernando Renteria on 10/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import UIKit

class VistaQueso: UIViewController {

    var step4Size: String = ""
    var step4Base: String = ""
    var step4Cheese: String = ""
    var step4Ingredientes: [String] = []
    
    @IBOutlet weak var step4Pedido: UILabel!
    
    @IBAction func AgregarQueso(sender: UIButton) {
        step4Cheese = sender.currentTitle!
        step4Pedido.text = mensajePizza()
    }
    
    /**
     * Impresión del estado de la pizza.
     */
    func mensajePizza()->String{
        var tamanioPedido: String = ""
        if (step4Cheese.isEmpty) {
            tamanioPedido = "Favor de elegir un tipo de queso."
        } else {
            tamanioPedido = "El queso que has elegido es: \(step4Cheese)"
        }
        
        return tamanioPedido
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "quesoMasa") {
            let vistaMasa = segue.destinationViewController as! VistaMasa
            vistaMasa.step2Size = step4Size
            vistaMasa.step2Base = step4Base
            vistaMasa.step2Cheese = step4Cheese
            vistaMasa.step2Ingredientes = step4Ingredientes
        }
        
        if (segue.identifier == "quesoIngredientes") {
            let vistaIngredientes = segue.destinationViewController as! VistaIngredientes
            vistaIngredientes.step3Size = step4Size
            vistaIngredientes.step3Base = step4Base
            vistaIngredientes.step3Cheese = step4Cheese
            vistaIngredientes.step3Ingredientes = step4Ingredientes
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        step4Pedido.text = mensajePizza()
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
