

public class UserLoginException extends Exception
{
	public UserLoginException() {
		
	}
	public UserLoginException(String error)
	{
		super(error);
	}
}