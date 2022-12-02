@IsTest

public class testClass {


    
    @IsTest public static void cenario1() {
        
        Opportunity novaOportunidade1 = new Opportunity();
        
        novaOportunidade1.Name = 'TESTE2';
        novaOportunidade1.StageName = 'Closed Lost';
        novaOportunidade1.Amount = 200000;
        novaOportunidade1.Description = 'null';
        novaOportunidade1.CloseDate = date.today() + 10;
        
        insert novaOportunidade1;
        
        test.startTest();
        
        novaOportunidade1.StageName = 'Negotiation/Review';
        
 		
         update novaOportunidade1;
        test.stopTest();
               
    }
    
    @IsTest public static void cenario2() {
        
        Opportunity novaOpp = new Opportunity();
        
        novaOpp.Name = 'TESTE7';
        novaOpp.StageName = 'Closed Won';
        novaOpp.Description = null;
        novaOpp.CloseDate = date.today() + 10;
        
        insert novaOpp;
        
        test.startTest();
        
        novaOpp.StageName = 'Closed Lost';
        update novaOpp;
        
        
        test.stopTest();
        
        
    }
    
    
    @IsTest public static void cenario3() {
        
        Lead novoLead = new Lead();
        
        novoLead.LastName = 'Test';
        novoLead.Company = 'Company Test';
        novoLead.CNPJ__c = '123654789-21';
        
        novoLead.regiao__c = 'Sul';
        
        insert novoLead;
        
        test.startTest();
        
        novoLead.regiao__c = 'Norte';
        
        update novoLead;
        
        test.stopTest();
        
        
    }
    
    
    @isTest
    public static void cenario4(){
        
        Lead newLead = new Lead();
        
        newLead.LastName = 'Teste da trigger';
        newLead.Company = 'Tomara que funcione';
        newLead.Status = 'Conectado';
        newLead.regiao__c = 'Sul';
        
        Task taskList = new Task();
        
       	 insert newLead;
        
        test.startTest();
        
        newLead.Status = 'Negociacao';
        
        update newLead;
        
        taskList.Subject = 'Tentar a conversão nos próximos 5 dias';
        
        taskList.WhoId = newLead.id;
        
        taskList.ActivityDate = date.today() + 5;
        
        list<Task> lstTask = [SELECT Id, WhoId FROM Task WHERE WhoId =: newLead.Id];
        
        lstTask.add(taskList);
        
        insert lstTask;
        
        test.stopTest();
  		

    }
    
    
    @IsTest static void cenario5(){
        
        Contact newContact = new Contact();
        
        newContact.LastName = 'testz';
        newContact.LeadSource = 'Site';
        
        insert newContact;
        
        test.startTest();
        
        newContact.LeadSource = 'Redes_Sociais';
        
        update newContact;
        
        newContact.LeadSource = 'Site';
        
        update newContact;
        
		newContact.LeadSource = 'Outros';
                     
		update newContact;	
        
        newContact.LeadSource = 'Lista adquirida';
        
        update newContact;
        
        newContact.LeadSource = 'Outros';
                     
		update newContact;
        
        newContact.LeadSource = 'Site';
             
		update newContact;	
        
        test.stopTest();
        
    }
    
    @IsTest static void cenario6(){
        
        
        Contact newContact = new Contact();
        
        newContact.LastName = 'testz';
        newContact.LeadSource = 'Outros';
        
        insert newContact;
        
    }
   
    
    
    @IsTest static void cenario7(){
        
        
        Contact newContact = new Contact();
        
        newContact.LastName = 'testz';
        newContact.LeadSource = 'Redes_Sociais';
        
        insert newContact;
        
    }
    
    @IsTest static void cenario8(){
        
        Contact ctc = new Contact();
        ctc.LastName = 'dale';
        ctc.LeadSource = 'lista adquirida';
        
        insert ctc;
        
        test.startTest();
        
        ctc.LeadSource = 'Site';
        
        update ctc;
        
        test.stopTest();
    }
   
    }