import { LightningElement, wire } from 'lwc';
import getListTopTenLeadConverted from '@salesforce/apex/LeadState.getListTopTenLeadConverted';

export default class TopTenLeadConverted extends LightningElement {
    leads
    error
    columns = [
        {label: 'Estado', fieldName: 'State'},
        {label: 'Quatidade', fieldName: 'expr0'},
    ]

    @wire(getListTopTenLeadConverted) wiredLeads({ error, data}) {
        if(data) {
            this.leads = data
            this.error = undefined
        } else if(error) {
            this.error = error
            this.leads = undefined
        }
    }
}