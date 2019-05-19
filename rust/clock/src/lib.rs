use std::fmt;

#[derive(Debug)]
pub struct Clock {
    hour: i32,
    minute: i32,
}

impl Clock {
    pub fn new(hours: i32, minutes: i32) -> Self {
        let minute_rollover = minutes / 60;
        let mut minute = minutes % 60;
        let mut hour = (hours + minute_rollover) % 24;
        while minute < 0 {
            minute += 60;
            hour -= 1;
        }
        while hour < 0 {
            hour += 24;
        }
        Clock { hour, minute }
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        Self::new(self.hour, self.minute + minutes)
    }
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "{:02}:{:02}", self.hour, self.minute)
    }
}

impl PartialEq for Clock {
    fn eq(&self, other: &Clock) -> bool {
        self.hour == other.hour && self.minute == other.minute
    }
}
