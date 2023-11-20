namespace :db do
  desc 'Updates vote counts for all candidates'
  task udpate_votes: :environment do
    puts 'Updating vote counts...'
    Candidate.all.each do |candidate|
      puts '.'
      Candidate.reset_counters(candidate.id, :vote_logs)
    end
    puts 'Done!'
  end
end
