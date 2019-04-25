//
//  TimeViewController.swift
//  Aula5Exe
//
//  Created by LOWCOST on 11/03/2019.
//  Copyright © 2019 PS. All rights reserved.
//

import UIKit

class TimeViewController: UIViewController {
    
    var time : Time = .Corinthians
    
    @IBOutlet weak var labelTime: UILabel!
    
    @IBOutlet weak var timeImage: UIImageView!
    
    @IBOutlet weak var timeTextView: UITextView!
    
    let hinoCorinthians = """
    Salve o Corinthians
    O campeão dos campeões
    Eternamente dentro dos nossos corações
    Salve o Corinthians de tradições e glórias mil
    Tu és orgulho
    Dos desportistas do Brasil
    
    Teu passado é uma bandeira
    Teu presente é uma lição
    Figuras entre os primeiros
    Do nosso esporte bretão
    
    Corinthians grande
    Sempre altaneiro
    És do Brasil
    O clube mais brasileiro
    
    Salve o Corinthians
    O campeão dos campeões
    Eternamente dentro dos nossos corações
    Salve o Corinthians de tradições e glórias mil
    Tu és orgulho
    Dos desportistas do Brasil
    """
    
    let hinoPalmeiras = """
    Quando surge o alviverde imponente
    No gramado em que a luta o aguarda
    Sabe bem o que vem pela frente
    Que a dureza do prélio não tarda!

    E o Palmeiras no ardor da partida
    Transformando a lealdade em padrão
    Sabe sempre levar de vencida
    E mostrar que, de fato, é campeão!

    Defesa que ninguém passa
    Linha atacante de raça
    Torcida que canta e vibra

    Defesa que ninguém passa
    Linha atacante de raça
    Torcida que canta e vibra

    Por nosso alviverde inteiro
    Que sabe ser brasileiro
    Ostentando a sua fibra!
    """
    
    let hinoSaoPaulo = """
    Salve o tricolor paulista
    Amado clube brasileiro
    Tu és forte, tu és grande
    Dentre os grandes és o primeiro!
    Tu és forte, tu és grande
    Dentre os grandes és o primeiro!

    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado!!!

    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado!!!

    São teus guias brasileiros
    Que te amam ternamente
    De São Paulo tens o nome
    Que ostentas dignamente!
    De São Paulo tens o nome
    Que ostentas dignamente!

    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado!

    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado!

    Tuas cores gloriosas
    Despertam um amor febril
    Pela terra bandeirantes
    Honra e glória do Brasil
    Pela terra bandeirante
    Honra e glória do Brasil

    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado
    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado

    Trazes glórias luminosas
    Do paulista imortal
    Da floresta também trazes
    Um brilho tradicional
    Da floresta também trazes
    Um brilho tradicional

    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado
    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado

    São Paulo clube querido
    Tu tens o nosso amor
    Teu nome e as tuas glórias
    Tem honra e resplendor
    Teu nome e as tuas glórias
    Tem honra e resplendor

    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado
    Ó tricolor
    Clube bem amado
    As tuas glórias
    Vêm do passado
    """
    
    let hinoSantos = """
    Sou alvinegro da Vila Belmiro
    O Santos vive no meu coração
    É o motivo de todo o meu riso
    De minhas lágrimas e emoção

    Sua bandeira no mastro é a história
    De um passado e um presente só de glórias
    Nascer, viver e no Santos morrer
    É um orgulho que nem todos podem ter

    No Santos pratica-se o esporte
    Com dignidade e com fervor
    Seja qual for a sua sorte
    De vencido ou vencedor

    Com técnica e disciplina
    Dando o sangue com amor
    Pela bandeira que ensina
    Lutar com fé e com ardor
    """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch time {
        case .Corinthians:
            labelTime.text = "Sport Clube Corinthians Paulista"
            timeImage.image = UIImage(imageLiteralResourceName: "corinthians")
            timeTextView.text = hinoCorinthians
        case .Palmeiras:
            labelTime.text = "Sociedade Esportiva Palmeiras"
            timeImage.image = UIImage(imageLiteralResourceName: "palmeiras")
            timeTextView.text = hinoPalmeiras
        case .SaoPaulo:
            labelTime.text = "São Paulo Futebol Clube"
            timeImage.image = UIImage(imageLiteralResourceName: "saopaulo")
            timeTextView.text = hinoSaoPaulo
        case .Santos:
            labelTime.text = "Santos Futebol Clube"
            timeImage.image = UIImage(imageLiteralResourceName: "santos")
            timeTextView.text = hinoSantos
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func verDetalhes(_ sender: Any) {
        performSegue(withIdentifier: "showDetails", sender: time)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {
            return
        }
        
        if identifier == "showDetails"{
            let nextVC = segue.destination as? DetailsViewController
            nextVC?.time = (sender as? Time)!
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
