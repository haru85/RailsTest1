class Plan < ApplicationRecord
    validates :title, presence: true, length: {maximum: 20}
    validates :start, presence: true
    validates :end, presence: true
    validates :memo, length: {maximum: 500}
    validate :end_check

    def end_check
        until self.end.nil? && self.start.nil?
            errors.add(:end, 'は、開始日以降の日付を入力して下さい') unless self.end >= self.start
        end
    end
end
