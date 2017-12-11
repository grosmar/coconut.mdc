package ;
import coconut.data.Model;
import tink.pure.List;

class TestModel implements Model
{
	@:constant var key0:{} = {};
	@:constant var key1:{} = {};
	@:constant var key2:{} = {};
	@:constant var key3:{} = {};
	@:constant var key4:{} = {};
	@:constant var keyt1:{} = {};
	@:constant var keyt2:{} = {};
	@:constant var keyte1:{} = {};
	@:constant var keyte2:{} = {};
	@:constant var keyte3:{} = {};
	@:constant var keyc1:{} = {};

	@:editable var activeTabIndex:Int = @byDefault 0;

	@:observable var notificationList:List<Notification> = @byDefault List.fromArray([]);

	@:computed var notificationCount:Int = notificationList.count( function(n) return n.unread );

	@:transition function addNotification(notification:Notification)
	{
		return /*{};*/{notificationList: notificationList.prepend(notification)};
	}
}

typedef Notification =
{
	var unread(default, never):Bool;
}
