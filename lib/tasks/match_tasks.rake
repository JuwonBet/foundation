# file: lib/tasks/match_tasks.rake

# Uncomment the following line to run task in development environment
# Rails.env = 'development'

desc 'match users with beginner package'
task match_beginner_package_users: :environment do
  begin
    page = 1
    test = UserPackage.where("package_id = '1'").limit(2).offset((page * 2) - 2)

    while test != nil && test.length > 1
      user_packages = UserPackage.where("package_id = '1'").limit(2).offset((page * 2) - 2)
      down_link = user_packages[0]
      up_link = user_packages[1]

      if Match.exists?(user_id: down_link.user_id, completion_status: 'pending')
        page += 1
        test = UserPackage.where("package_id = '1'").limit(2).offset((page * 2) - 2)
        next
      end

      match = Match.new
      match.user =  User.find(down_link.user_id)
      match.matched_user = User.find(up_link.user_id)
      match.completion_status = 'pending'
      match.save!

      page += 1
      test = UserPackage.where("package_id = '1'").limit(2).offset((page * 2) - 2)
    end
  rescue Exception => e
    puts e.message
  end
end

desc 'match users with beginner package'
task match_beginner_package_users: :environment do
  begin
    first_link = UserPackage.order('rand()').where("package_id = '1'").limit(1)
    first_user_link = User.find(first_link.user_id)

    if first_user_link.activated?

    end


    while test != nil && test.length > 1
      user_packages = UserPackage.where("package_id = '1'").limit(2).offset((page * 2) - 2)
      down_link = user_packages[0]
      up_link = user_packages[1]

      if Match.exists?(user_id: down_link.user_id, completion_status: 'pending')
        page += 1
        test = UserPackage.where("package_id = '1'").limit(2).offset((page * 2) - 2)
        next
      end

      match = Match.new
      match.user =  User.find(down_link.user_id)
      match.matched_user = User.find(up_link.user_id)
      match.completion_status = 'pending'
      match.save!

      page += 1
      test = UserPackage.where("package_id = '1'").limit(2).offset((page * 2) - 2)
    end
  rescue Exception => e
    puts e.message
  end
end

desc 'match users with beginner package'
task match_pro_package_users: :environment do
  begin
    page = 1
    test = UserPackage.where("package_id = '2'").limit(2).offset((page * 2) - 2)
    puts test.inspect
    while test != nil && test.length > 1
      user_packages = UserPackage.where("package_id = '2'").limit(2).offset((page * 2) - 2)
      down_link = user_packages[0]
      up_link = user_packages[1]

      if Match.exists?(user_id: down_link.user_id, completion_status: 'pending')
        page += 1
        test = UserPackage.where("package_id = '2'").limit(2).offset((page * 2) - 2)
        next
      end

      match = Match.new
      match.user =  User.find(down_link.user_id)
      match.matched_user = User.find(up_link.user_id)
      match.completion_status = 'pending'
      match.save!

      page += 1
      test = UserPackage.where("package_id = '2'").limit(2).offset((page * 2) - 2)
    end
  rescue Exception => e
    puts e.message
  end
end

desc 'match users with beginner package'
task match_expert_package_users: :environment do
  begin
    page = 1
    test = UserPackage.where("package_id = '3'").limit(2).offset((page * 2) - 2)
    puts test.inspect
    while test != nil && test.length > 1
      user_packages = UserPackage.where("package_id = '3'").limit(2).offset((page * 2) - 2)
      down_link = user_packages[0]
      up_link = user_packages[1]

      if Match.exists?(user_id: down_link.user_id, completion_status: 'pending')
        page += 1
        test = UserPackage.where("package_id = '3'").limit(2).offset((page * 2) - 2)
        next
      end

      match = Match.new
      match.user =  User.find(down_link.user_id)
      match.matched_user = User.find(up_link.user_id)
      match.completion_status = 'pending'
      match.save!

      page += 1
      test = UserPackage.where("package_id = '3'").limit(2).offset((page * 2) - 2)
    end
  rescue Exception => e
    puts e.message
  end
end

desc 'match users with beginner package'
task match_hi_tech_package_users: :environment do
  begin
    page = 1
    test = UserPackage.where("package_id = '4'").limit(2).offset((page * 2) - 2)
    puts test.inspect
    while test != nil && test.length > 1
      user_packages = UserPackage.where("package_id = '4'").limit(2).offset((page * 2) - 2)
      down_link = user_packages[0]
      up_link = user_packages[1]

      if Match.exists?(user_id: down_link.user_id, completion_status: 'pending')
        page += 1
        test = UserPackage.where("package_id = '4'").limit(2).offset((page * 2) - 2)
        next
      end

      match = Match.new
      match.user =  User.find(down_link.user_id)
      match.matched_user = User.find(up_link.user_id)
      match.completion_status = 'pending'
      match.save!

      page += 1
      test = UserPackage.where("package_id = '4'").limit(2).offset((page * 2) - 2)
    end
  rescue Exception => e
    puts e.message
  end
end