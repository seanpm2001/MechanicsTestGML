///@description Variables initialization

vidas = 5;
path = path_add();

timer = random_range(room_speed/2, room_speed);
idle_timer = room_speed/6;
dash_timer = room_speed * 5;

instantiate_bullet = undefined;
alarm_bullet = random_range(2, 4);
distance_bl = undefined;
inst_bl = undefined;

enum state {idle, walking, shooting, catching};
state = state.idle;

estado_anterior = undefined;

#region WalkArea

x_range = undefined;
y_range = undefined;

x_goal =  undefined;
y_goal = undefined;

#endregion

alarm[0] = idle_timer;

walking_demand = 0;
shooting_demand = 0;
add_demands = true;
interfer_demands = false;