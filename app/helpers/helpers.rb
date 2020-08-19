class Helpers

# find the user in the database and returns them
  def self.current_user(session_hash)
    User.find(session_hash[:user_id])
  end

# returns true or false depending on whether the user_id is in the session hash
  def self.is_logged_in?(session_hash)
    !!session_hash.include?(:user_id)
  end

end
