require 'rails_helper'
require 'spec_helper'
require 'elevator_media/Streamer'
require 'rest-client'

describe ElevatorMedia::Streamer do
    let!(:streamer){ElevatorMedia::Streamer.new}

    # Testing if a first basic test gives back a successful response
    it "a first test to initialize environment" do
        expect(true).to be true
    end

    it "should receive a response from getContent" do
        expect(streamer).to respond_to(:getContent)        
    end

    describe "getContent behavior" do
        # Testing if the getHtmlFromCloud method returns "interesting" html content described in the tests below
        it "should get interesting html content from internet" do
            expect(streamer).to receive(:getHtmlFromCloud)
            streamer.getContent()
        end

        # Testing if the default type of the getContent method returns 'chuck_norris' type content
        it "default content should be of 'chuck_norris' type" do
            expect(streamer).to receive(:getChuckNorrisQuote).and_return({value: {joke: 'Chuck Norris joke received'}}.to_json) 
            streamer.getContent('chuck_norris')
        end
        
    end
        # Testing if the Chuck Norris database returns a succesful quote, printing a quote in the console
        it 'got response from Chuck Norris database' do
            json_response = JSON.parse(streamer.getChuckNorrisQuote)
            p json_response
            expect(json_response["type"]).to eq("success")
        end   
end