//
//  VistaIngredientes.swift
//  PizzaProvider
//
//  Created by Fernando Renteria on 10/01/2016.
//  Copyright © 2016 Fernando Renteria. All rights reserved.
//

import UIKit

class VistaIngredientes: UIViewController {
    
    // Variables
    var step3Size: String = ""
    var step3Base: String = ""
    var step3Cheese: String = ""
    var step3Ingredientes: [String] = []
    
    @IBOutlet weak var error: UILabel!
    
    @IBOutlet weak var step3Pedido: UILabel!
    
    @IBOutlet weak var anchoas: UIButton!
    @IBOutlet weak var salami: UIButton!
    @IBOutlet weak var pina: UIButton!
    @IBOutlet weak var jamon: UIButton!
    @IBOutlet weak var camaron: UIButton!
    @IBOutlet weak var champiniones: UIButton!
    @IBOutlet weak var cebolla: UIButton!
    
    @IBAction func AgregarIngrediente(sender: UIButton) {
        let ingrediente: String = sender.currentTitle!
        if (!step3Ingredientes.contains(ingrediente)) {
            if (step3Ingredientes.count < 5) {
                step3Ingredientes.append(ingrediente)
                step3Pedido.text = desplegarIngredientes()
                error.text = ""
            } else {
                error.text = "Sólo puedes utlizar hasta 5 ingredientes."
            }
        } else {
            error.text = "Este ingrediente se encuentra en la lista."
        }
    }
    
    func desplegarIngredientes()->String {
        var ingredientes: String = ""
        if (step3Ingredientes.count > 0) {
            for item in step3Ingredientes {
                let ingrediente: String = String(item)
                ingredientes = ingredientes.stringByAppendingString("\t \(ingrediente) \n")
            }
        } else {
            ingredientes = "Favor de seleccionar hasta 5 ingredientes."
        }
        return ingredientes
    }
    
    @IBAction func eliminarAnchoas(sender: UIButton) {
        let ingrediente: String = anchoas.currentTitle!
        remueveIngrediente(ingrediente)
    }
    
    @IBAction func eliminarSalami(sender: UIButton) {
        let ingrediente: String = salami.currentTitle!
        remueveIngrediente(ingrediente)
    }
    
    @IBAction func eliminarPina(sender: UIButton) {
        let ingrediente: String = pina.currentTitle!
        remueveIngrediente(ingrediente)
    }
    
    @IBAction func eliminarJamon(sender: UIButton) {
        let ingrediente: String = jamon.currentTitle!
        remueveIngrediente(ingrediente)
    }
    
    @IBAction func eliminarCamaron(sender: UIButton) {
        let ingrediente: String = camaron.currentTitle!
        remueveIngrediente(ingrediente)
    }
    
    @IBAction func eliminarChampiniones(sender: UIButton) {
        let ingrediente: String = champiniones.currentTitle!
        remueveIngrediente(ingrediente)
    }
    
    @IBAction func eliminarCebolla(sender: UIButton) {
        let ingrediente: String = cebolla.currentTitle!
        remueveIngrediente(ingrediente)
    }
    
    func remueveIngrediente(ingrediente: String) {
        
        if (!step3Ingredientes.isEmpty) {
            let indexIngrediente: Int? = step3Ingredientes.indexOf(ingrediente)
            
            if (indexIngrediente != nil) {
                step3Ingredientes.removeAtIndex( Int(indexIngrediente!))
                step3Pedido.text = desplegarIngredientes()
                error.text = ""
            }
        
        }
    }
        
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ingredientesQueso") {
            let vistaQueso = segue.destinationViewController as! VistaQueso
            vistaQueso.step4Size = step3Size
            vistaQueso.step4Base = step3Base
            vistaQueso.step4Cheese = step3Cheese
            vistaQueso.step4Ingredientes = step3Ingredientes
        }

        if (segue.identifier == "ingredientesResumen") {
            let vistaResumen = segue.destinationViewController as! VistaResumen
            vistaResumen.step5Size = step3Size
            vistaResumen.step5Base = step3Base
            vistaResumen.step5Cheese = step3Cheese
            vistaResumen.step5Ingredientes = step3Ingredientes
        }

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        step3Pedido.text = desplegarIngredientes()
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
