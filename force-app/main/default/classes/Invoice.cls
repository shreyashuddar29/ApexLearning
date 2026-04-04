public with sharing class Invoice {
    public string invoiceNumber;
    public decimal amount;
    public void printDetails(){
        System.debug('Invoice Number: ' + invoiceNumber);
        System.debug('Amount: ' + amount);
    }
}