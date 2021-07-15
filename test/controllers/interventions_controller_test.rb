require 'test_helper'

class InterventionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @intervention = interventions(:one)
  end

  test "should get index" do
    get interventions_url
    assert_response :success
  end

  test "should get new" do
    get new_intervention_url
    assert_response :success
  end

  test "should create intervention" do
    assert_difference('Intervention.count') do
      post interventions_url, params: { intervention: { author: @intervention.author, batteryid: @intervention.batteryid, buildingid: @intervention.buildingid, columnid: @intervention.columnid, customerid: @intervention.customerid, elevatorid: @intervention.elevatorid, employeeid: @intervention.employeeid, enddate: @intervention.enddate, report: @intervention.report, result: @intervention.result, startdate: @intervention.startdate, status: @intervention.status } }
    end

    assert_redirected_to intervention_url(Intervention.last)
  end

  test "should show intervention" do
    get intervention_url(@intervention)
    assert_response :success
  end

  test "should get edit" do
    get edit_intervention_url(@intervention)
    assert_response :success
  end

  test "should update intervention" do
    patch intervention_url(@intervention), params: { intervention: { author: @intervention.author, batteryid: @intervention.batteryid, buildingid: @intervention.buildingid, columnid: @intervention.columnid, customerid: @intervention.customerid, elevatorid: @intervention.elevatorid, employeeid: @intervention.employeeid, enddate: @intervention.enddate, report: @intervention.report, result: @intervention.result, startdate: @intervention.startdate, status: @intervention.status } }
    assert_redirected_to intervention_url(@intervention)
  end

  test "should destroy intervention" do
    assert_difference('Intervention.count', -1) do
      delete intervention_url(@intervention)
    end

    assert_redirected_to interventions_url
  end
end
