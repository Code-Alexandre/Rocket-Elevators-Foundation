Week 8 - Life is a Web Service

During this week we used the following APIs in our website: -Google Maps -Twilio -Slack -DropBox -SendGrid -IBM Watson -ZenDesk

All the accounts on those website have been created with the following user: Username: rocketelevator@hotmail.com PW: Codeboxx1!

Here's how to test all the APIs we used: Google Maps: When you click on the Google Maps tab in the admin section, a map with markers for each address and informations about the building for this address will be generated. NOTE-- This can take a long time to load and you may be prompted with an error if it takes too long, just refresh the page.

Twilio: When the status of an elevator is set to "Intervention" from the admin section, the technical contact assigned to the building associated with the elevator will receive an SMS.

Slack: While in the admin dashboard, click on "Elevators" on the lefthand panel. When the status of an elevator is changed, it will send a notification in the Rocket Elevators channel on Slack.

Dropbox: The Dropbox API takes files that are uploaded via the contact form and when a customer is created or edited, a command will be executed to verify if the emails match and if it does, the previously uploaded attachment will be sent to Dropbox for safekeeping.

Sendgrid: After customers fill out the contact form, the Sendgrid API will reach out to them via email to greet them and assure them that a representative will contact them shortly.

IBM Watson: When you click on the Watson tab in the admin section, a single button will appear which will greet the current user and give a brief summary of the elements contained in the database. NOTE-- It seems that the script for the button takes some time to execute the command and you may need to reload the page or the tab to have the message update when a modification is done.

Zendesk: When a customer sends a contact form or a quote, the Zendesk API is triggered and a new ticket is created on the behalf of the customer. This ticket contains the customer's contact information and provides an easy way for the Rocket Elevators support team to respond to customers and follow up on requests.

Week 9 - Consolidation

Employees who are logged in can now fill out a form to request an intervention on a customer's building by clicking on the "Interventions" tab located in the navigation bar. This form will send the datas to the server once submitted and will create a ticket on Zendesk.

Zendesk: A new account has been created, contact and quote form will still create tickets when submitted. Interventions requests will create a "Problem" type ticket when submitted and it can be accessible with these informations: Domain => code-alexandre.zendesk.com password => Windynumber22 email: alex.lapres@outlook.com

RESTAPI: Three new endpoints have been added to the REST API from last week. They can be accessible on this repo => 
https://github.com/Code-Alexandre/Rocket_Elevators_REST_API.git Ask me access if you need it.


The new end points are:

10-Returns all fields of all intervention Request records that do not have a start date and are in "Pending" status.
https://code-alexandre.azurewebsites.net/api/intervention
11-Change the status of the intervention request to "InProgress" and add a start date and time (Timestamp). 
https://code-alexandre.azurewebsites.net/api/intervention/1/InProgress

12-Change the status of the request for action to "Completed" and add an end date and time (Timestamp). 
https://code-alexandre.azurewebsites.net/api/intervention/1/Completed

Week 10 Quality and TDD / Security

This week, we created a module called ElevatorMedia using the test-driven-development method. It is located in 'lib' folder and the tests are in the 'spec' folder. I also tried making the same test using javascript and jest which are located on this repo: https://github.com/Code-Alexandre/Rocket-Elevators-Foundation-javascript.git

For the Security part, I created a google Docs and here is the url to read it: https://docs.google.com/document/d/15wUTH16e-d9lIoeVEMnSQJ1IT-f4BH0Wsf_lex4Fsqw/

Week 13 Machine Learning


For the profil 


select folder profil/Alex.wav

select folder profil/AlexFR.wav

select folder profil/math-En.wav

select folder profil/math-francais.wav

select folder profil/Eng-Emmanuel-new.wav

select folder profil/FR-Emmanuel-new.wav

For the Conversation test Identify


profil/Alex.wav = convo/mathieu-3.wav

profil/AlexFR.wav = convo/mathieu-6.wav or convo/mathieu-7.wav or convo/mathieu-8.wav or convo/mathieu-9.wav or convo/mathieu-10.wav

profil/math-En.wav = convo/mathieu-4.wav

profil/math-francais.wav = convo/mathieu-6.wav or convo/mathieu-7.wav or convo/mathieu-8.wav or convo/mathieu-9.wav or convo/mathieu-10.wav

profil/Eng-Emmanuel-new.wav = convo/mathieu-2.wav or convo/mathieu-5.wav

profil/FR-Emmanuel-new.wav = convo/mathieu-7.wav or convo/mathieu-9.wav
