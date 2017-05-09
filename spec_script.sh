if[ -f config/database.yml ]; then
    mv config/database.yml config/database.yml.remote
    mv config/database.yml.spec config/database.yml

    bundle exec rspec

    mv config/database.yml config/database.yml.spec
    mv config/database.yml.remote config/database.yml
else
    $BIN_ECHO "You are not in the right directory"
fi


