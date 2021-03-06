package collaboRhythm.plugins.foraD40b.model
{
	import collaboRhythm.plugins.foraD40b.controller.BloodGlucoseDataInputController;
	import collaboRhythm.plugins.foraD40b.controller.BloodPressureDataInputController;
	import collaboRhythm.plugins.foraD40b.view.BloodGlucoseDataInputView;
	import collaboRhythm.plugins.foraD40b.view.BloodPressureDataInputView;
	import collaboRhythm.plugins.schedule.shared.controller.DataInputControllerBase;
	import collaboRhythm.plugins.schedule.shared.model.IDataInputControllerFactory;
	import collaboRhythm.plugins.schedule.shared.model.IScheduleModel;
	import collaboRhythm.shared.model.healthRecord.document.ScheduleItemOccurrence;

	import flash.net.URLVariables;

	import spark.components.ViewNavigator;

	public class ForaD40bDataInputControllerFactory implements IDataInputControllerFactory
	{
		private static const NAME:String = "FORA D40b";
		private static const BLOOD_PRESSURE:String = "Blood Pressure";
		private static const BLOOD_GLUCOSE:String = "Blood Glucose";
		private static const BLOOD_PRESSURE_INSTRUCTIONS:String = "press the power button and wait several seconds to take reading";// "Use device to record blood pressure systolic and blood pressure diastolic readings. Heart rate will also be recorded. Press the power button and wait several seconds to take reading.";
		private static const BLOOD_GLUCOSE_INSTRUCTIONS:String = "Use device to record blood glucose. Insert test strip into device and apply a drop of blood.";

		public function ForaD40bDataInputControllerFactory()
		{
		}

		public function isMatchingDataInputControllerFactory(name:String):Boolean
		{
			return name == NAME;
		}

		public function createHealthActionInputController(name:String, measurements:String,
												  scheduleItemOccurrence:ScheduleItemOccurrence,
												  urlVariables:URLVariables,
												  scheduleModel:IScheduleModel,
												  viewNavigator:ViewNavigator):DataInputControllerBase
		{
			if (measurements == BLOOD_PRESSURE || measurements == BLOOD_PRESSURE_INSTRUCTIONS)
				return new BloodPressureDataInputController(scheduleItemOccurrence, urlVariables, scheduleModel, viewNavigator);
			else if (measurements == BLOOD_GLUCOSE || measurements == BLOOD_GLUCOSE_INSTRUCTIONS)
				return new BloodGlucoseDataInputController(scheduleItemOccurrence, urlVariables, scheduleModel, viewNavigator);
			else
				return null;
		}
	}
}
