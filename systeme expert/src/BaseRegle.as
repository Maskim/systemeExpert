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
		
		public function getFirstPremices(): Array {
			
			var tteConclusion:Array = touteConclusion();
			var ttpremices:Array = ttPremices();
			
			var firstPremice:Array = new Array();
			
			for (var i:int = 0 ; i < ttpremices.length; i++)
			{
				if (isNotIn(tteConclusion, ttpremices[i]))
				{
					firstPremice.push(ttpremices[i]);
				}
			}
			
			return firstPremice;
		}
		
		private function ttPremices():Array 
		{
			var listeDeToutLesPremices:Array = new Array();
			
			for (var i:int = 0; i < regles.length; i++)
			{
				var premiceTemp:Array = regles[i].getPremices();
				for (var j:int = 0 ; j < premiceTemp.length; j++)
				{
					if ( isNotIn(listeDeToutLesPremices, premiceTemp[j]) ) {
						listeDeToutLesPremices.push(premiceTemp[j]);
					}
				}
			}
			
			return listeDeToutLesPremices;
		}
		
		public function isNotIn(tableau:Array, index:Fait):Boolean
		{
			for (var i:int = 0; i < tableau.length; i++)
			{
				if (tableau[i] == index)
					return false;
			}
			return true;
		}
		
		public function touteConclusion():Array {
			var tteConclusion:Array = new Array();
			
			for (var i:int = 0; i < regles.length; i++)
			{
				tteConclusion.push(regles[i].getConclusion());
			}
			
			return tteConclusion;
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