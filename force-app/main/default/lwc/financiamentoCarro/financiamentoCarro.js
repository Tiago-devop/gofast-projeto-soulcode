import { LightningElement } from 'lwc';

export default class FinanciamentoCarro extends LightningElement {
    visivel = false
    carro
    entrada
    parcelas
    financiamento
    valorParcela
    valorTotalCarro
    taxa
    inputs = []

    handleReset() {
        this.inputs.forEach(item => {
            item.value = ''
        })
        this.visivel = false
    }

    handleClickfinanciarAutomovel() {
        this.visivel = true
        this.inputs = [...this.template.querySelectorAll('lightning-input')]
        this.inputs.forEach(item => {
            if (item.name === 'carro') {
                this.carro = item.value
            }
            if (item.name === 'entrada') {
                this.entrada = item.value
            }
            if (item.name === 'parcelas') {
                this.parcelas = item.value
            }
        })
        const TAXAC = 0.05;
        let financiamento = this.carro - this.entrada;
        let valorParcela = (financiamento + (financiamento * 0.05)) / this.parcelas;

        this.taxa = (financiamento * TAXAC).toFixed(2)

        valorParcela = valorParcela.toFixed(2)

        this.valorTotalCarro = ((financiamento * TAXAC) + financiamento + +this.entrada).toFixed(2)
        this.financiamento = financiamento.toFixed(2)
        this.valorParcela = valorParcela
    }

}