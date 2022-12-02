import { LightningElement , wire} from 'lwc';
import getListLeadDisqualified  from '@salesforce/apex/LeadState.getListLeadDisqualified';


export default class LeadState extends LightningElement {
    leads;
    error;

    columns = [
        {label: 'Quantidade', fieldName: "expr0"},
        {label: 'Estado', fieldName:'State'},  
    ]

    @wire(getListLeadDisqualified)wiredLeads({error, data}){
        if(data){
            this.leads = data;
            console.log('Data',data)
            this.error = undefined;
        }else if(error){
            this.error = error;
            this.leads = undefined;
        }
    }
}