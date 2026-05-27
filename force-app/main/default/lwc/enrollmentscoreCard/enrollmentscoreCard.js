import { LightningElement, api, wire } from 'lwc';

import getLatestScore
from '@salesforce/apex/EnrollmentScoreController.getLatestScore';

export default class EnrollmentScoreCard extends LightningElement {

    @api recordId;

    scoreData;

    @wire(getLatestScore, { contactId: '$recordId' })
    wiredScore({ data, error }) {

        if(data) {
            this.scoreData = data;
        }
        else if(error) {
            console.error(error);
        }
    }

    get priorityLabel() {

        if(!this.scoreData) {
            return '';
        }

        let score = this.scoreData.Score__c;

        if(score >= 75) {
            return '🔴 Hot';
        }

        if(score >= 40) {
            return '🟠 Warm';
        }

        return '🔵 Cold';
    }
}