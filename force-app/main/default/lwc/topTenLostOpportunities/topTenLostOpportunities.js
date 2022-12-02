import { LightningElement, wire } from 'lwc';
import getListOpportunitiesClosed from '@salesforce/apex/OpportunityController.getListOpportunitiesClosed';

export default class TopTenLostOpportunities extends LightningElement {
    opportunities
    error
    columns = [
        {label: 'Nome', fieldName: 'Name'},
        {label: 'Fase', fieldName: 'StageName'},
        {label: 'Motivo', fieldName: 'Description'},
    ]

    @wire(getListOpportunitiesClosed) wiredOpportunities({ error, data }) {
        if(data) {
            this.opportunities = data
            this.error = undefined
        } else if(error) {
            this.error = error
            this.opportunities = undefined
        }
    }
}