package Objects 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask
	
	/**
	 * @author Wago
	 */
	public class Bullet extends Physics
	{
		public var sprite:Image = new Image(Assets.OBJECT_BULLET);
		public var movement:Number = 8;
		
		public function Bullet(x:int, y:int) 
		{
			//our x/y position
			super(x, y);
			
			//graphic & hitbox
			graphic = sprite;
			mask = new Pixelmask(Assets.OBJECT_BULLET);
			type = "Bullet";
		}
		
		override public function update():void {
			//move ourselves
			speed.x = movement;
			motion(true, false);
			
			if (collide("Solid", x-1, y) || collide("Solid", x+1, y))
			{
				FP.world.remove(this);
			}
			
			if (collide("Bullet", x, y)) 
			{
				FP.world.remove(this);
			}
			if (collide("enemy", x, y))
			{
				FP.world.remove(this);
			}
			
		}
			public function destroy():void
			{
				// Here we could place specific destroy-behavior for the Bullet.
				FP.world.remove(this);
			}

		
	}

}