//
//  CadastroViewController.swift
//  SimulaCadastro
//
//  Created by Alan Fritsch on 30/03/19.
//  Copyright © 2019 Alan Fritsch. All rights reserved.
//

import UIKit

class CadastroViewController: UIViewController {

    var tarefa : Tarefa?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        edDataLimite.minimumDate = Date()
        atualizaDataLimite(date: edDataLimite.minimumDate!)
    }

    func atualizaEstadoBotaoSalvar() {
        let text = edTitulo.text ?? ""
        btSalvar.isEnabled = !text.isEmpty
    }
    
    func atualizaDataLimite(date: Date) {
        btDataLimite?.setTitle(Tarefa.dateFormatter.string(from: date), for: .normal)
    }
    
    func setarTarefa(novaTarefa : Tarefa?) {
        tarefa = novaTarefa
        
        edTitulo.text = tarefa?.titulo
        edDataLimite.date = tarefa?.dataLimite ?? Date()
        atualizaDataLimite(date: edDataLimite.date)
    
        edDescricao.text = novaTarefa?.descricao
        edResponsavel.text = novaTarefa?.responsavel
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "salvarSegue" {
            let titulo = edTitulo.text!
            let dataLimite = edDataLimite.date
            let descricao = edDescricao.text!
            let responsavel = edResponsavel.text!
            
            if (tarefa == nil) {
                tarefa = Tarefa(titulo: titulo, descricao: descricao, dataLimite: dataLimite, responsavel: responsavel)
            } else {
                tarefa?.dataLimite = dataLimite
                tarefa?.descricao = descricao
                tarefa?.titulo = titulo
                tarefa?.responsavel = responsavel
            }
            
            let detalheViewController = segue.destination
                as! DetalheViewController
            
            detalheViewController.tarefa = tarefa
        }
        
        
    }
    
    
    @IBOutlet weak var edTitulo: UITextField!
    @IBOutlet weak var edDescricao: UITextView!
    @IBOutlet weak var edResponsavel: UITextField!
    @IBOutlet weak var btDataLimite: UIButton!
    @IBOutlet weak var edDataLimite: UIDatePicker!
    @IBOutlet weak var btSalvar: UIButton!
    
    @IBAction func btDataLimiteTouched() {
        let isPickerHidden = !edDataLimite.isHidden
        
        btDataLimite.tintColor =
            isPickerHidden ? .blue : .black
        
        edDataLimite.isHidden = isPickerHidden
    }
    
    
    @IBAction func edDataLimiteChanged(_ sender: Any) {
        atualizaDataLimite(date: edDataLimite.date)
    }
    
    @IBAction func unwindToCadastro(segue: UIStoryboardSegue) {
        
        let sourceViewController = segue.source as! DetalheViewController
        if segue.identifier == "voltarUnwind" {
            if let tarefaRetornada = sourceViewController.tarefa {
                setarTarefa(novaTarefa: tarefaRetornada)
            }
        } else if segue.identifier == "novoUnwind" {
            setarTarefa(novaTarefa: nil)
        }        
    }
    
}

