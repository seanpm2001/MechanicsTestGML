/// @description enemy AI and stuff

if (vidas <= 0)
	instance_destroy();

if(object_exists(obj_player))
{
	if(state = state.idle)
	{
	
		if(alarm[0] <= 0)
		{
			x_goal =  (x_range div 100) * 100 + 50;
			y_goal = (y_range div 80) * 80 + 40;
		
			alarm[0] = idle_timer;
			//state = choose(state.walking, state.shooting);
			
			if(cent_walking <= 5 || cent_shooting <= 5)
			{
				state = choose(state.walking, state.shooting);
				add_cents = true;
			}
			else  if(cent_walking > 4 || cent_shooting > 4)
			{
				add_cents = false;
				
				if(cent_walking > cent_shooting)
				{
					state = state.shooting;
					cent_walking --;
				}
				else if(cent_walking < cent_shooting)
				{
					state = state.walking;
					cent_shooting --;
				}
			}
			if(add_cents)
			{			
				if(state == state.walking)
				{
					cent_walking ++;
				}
			 
				if(state == state.shooting)
				{
					cent_shooting ++;
				}
			}
			
			show_debug_message("Walking: " + string(cent_walking));
			show_debug_message("Shooting: " + string(cent_shooting));
			show_debug_message("Actual State: " + string(state));
			
		}
		else
		{
			x_range = random_range(room_width/2, room_width);
			y_range = random_range(room_height/2, room_height);
		
			//animação de procurando lugar ou algo do tipo
		}
	}

	if(state = state.walking)
	{
		if(alarm[0] <= 0)
		{
			if(mp_grid_path(global.grid, path, x, y, x_goal, y_goal, 0))
				path_start(path, 4, path_action_stop, false);
			
			alarm[0] = timer;
			//state = choose(state.idle, state.shooting);
			state = state.idle;
		}
	}

	if(state = state.shooting)
	{
		if(alarm[0] <= 0)
		{
			instantiate_Action = scrp_inst_enemy;
		
			alarm[1] = alarm_bullet;		
			alarm[0] = timer;
		
			state = state.idle;
		}
	}
}

#region Limit

if(x_goal <= 550)
{
	x_goal = 550;
}
else if(x_goal >= 950)
{
	x_goal = 950;
}

if(y_goal <= 120)
{
	y_goal = 120;
}
else if(y_goal >= 680)
{
	y_goal = 680;
}
#endregion