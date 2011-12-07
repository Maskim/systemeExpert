package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Maxime
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
			var sys:SystemExpert = new SystemExpert();
			 sys.addRegle(new Array("beau", "chaud"), "piscine");
			 sys.addRegle(new Array("soleil", "bierre"), "Maldetête");
			 sys.addRegle(new Array("beau", "glaçon", "soda"), "boire");
			 sys.addRegle(new Array("piscine"), "bierre");
			 sys.addRegle(new Array("beau"), "soda");
			 sys.addRegle(new Array("chaud", "soda"), "glaçon");
			 
			 sys.devenirVrai("beau");
			 sys.devenirVrai("chaud");
			 sys.devenirVrai("soleil");
			 
			 sys.chainageAvant();
			 sys.chainageArriere();
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}