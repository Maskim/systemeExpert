package  
{
	/**
	 * ...
	 * @author Maxime
	 */
	public class BaseRegle 
	{
		private var regles:Array;
		
		public function BaseRegle() 
		{
			regles = new Array();
		}
		
		public function addRegle(_regles:Regle):void
		{
			
			regles.push(_regles);
		}
		
		public function getRegles():Array
		{
			return regles;
		}
		
		public function getRegle(index:int) :Regle
		{
			return regles[index];
		}
	}

}