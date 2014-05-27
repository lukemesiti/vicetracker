Pony.options = {
    :to => 'vicetracker2014@gmail.com',
    :via => :smtp,
    :via_options => {
        :address                => 'smtp.gmail.com',
        :port                   => '587',
        :enable_startls_auto    => true,
        :user_name              => ENV['USER_ID'],
        :password               => ENV['USER_PASSWORD'],
        :authentication         => :plain,
        :domain                 => "localhost.localdomain"
    }
}