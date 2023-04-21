import { LightningElement } from 'lwc';
import getLatestAccounts from '@salesforce/apex/AccountHelper.getLatestAccounts';

export default class AccountDisplay extends LightningElement {
    accounts;
    error=false;
    connectedCallback() {
        this.getData();
    }

    //method to fetch data from apex
    async getData() {
        try {
            this.accounts = await getLatestAccounts();
            if (this.accounts.length === 0) {
                this.error = 'No Data Found';
            }
        } catch (e) {
            this.error = e;
        }
        console.log(this.accounts)
    }
}