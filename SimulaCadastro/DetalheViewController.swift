//
//  DetalheViewController.swift
//  SimulaCadastro
//
//  Created by Alan Fritsch on 30/03/19.
//  Copyright © 2019 Alan Fritsch. All rights reserved.
//

import UIKit

class DetalheViewController: UIViewController {
    
    var tarefa: Tarefa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tarefa = tarefa {            
            edDataCriacao.text = Tarefa.dateFormatter.string(from: tarefa.dataCriacao)
            edDescricao.text = tarefa.descricao
            edTitulo.text = tarefa.titulo
            edDataLimite.text = Tarefa.dateFormatter.string(from: tarefa.dataLimite)
            edResponsavel.text = tarefa.responsavel
        }
    }
    
    @IBOutlet weak var edDataCriacao: UILabel!
    @IBOutlet weak var edTitulo: UILabel!
    @IBOutlet weak var edDescricao: UILabel!
    @IBOutlet weak var edDataLimite: UILabel!
    @IBOutlet weak var edResponsavel: UILabel!
}
