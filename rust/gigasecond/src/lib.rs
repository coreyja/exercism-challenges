use chrono::{DateTime, Utc};
use time::Duration as OldDuration;

// Returns a Utc DateTime one billion seconds after start.
pub fn after(start: DateTime<Utc>) -> DateTime<Utc> {
    let giga = OldDuration::seconds(10_i64.pow(9));
    start + giga
}
