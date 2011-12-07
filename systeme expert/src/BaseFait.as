package  
{
	/**
	 * ...
	 * @author Maxime
	 */
	public class BaseFait 
	{
		private var fait:Array;
		
		public function BaseFait() 
		{
			fait = new Array();
		}
		
		public function addFait(_fait:Fait):void
		{
			fait.push(_fait);
		}
		
		public function getFait(FaitId:String) :Fait{
			var faitProvisoir:Fait;
			for (var i:int = 0; i < fait.length; i++ )
			{
				if (fait[i].getFaitId() == FaitId)
				{
					faitProvisoir = fait[i];
				}
			}
			
			return faitProvisoir;
		}
		
		public function existe(_fait:String) :Boolean
		{
			for (var i:int = 0; i < fait.length; i++ )
			{
				if (fait[i].getFaitId() == _fait)
				{
					return true;
				}
			}
			return false
		}
	}

}