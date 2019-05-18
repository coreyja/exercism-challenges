fn shouting(chars: &Vec<char>) -> bool {
    chars.iter().any(|x| x.is_alphabetic()) && !chars.iter().any(|x| x.is_lowercase())
}

fn question(chars: &Vec<char>) -> bool {
    chars[chars.len() - 1] == '?'
}

pub fn reply(message: &str) -> &str {
    let stripped = message.trim();
    if stripped == "" {
        "Fine. Be that way!"
    } else {
        let chars: Vec<char> = stripped.to_string().chars().collect();
        if shouting(&chars) {
            if question(&chars) {
                "Calm down, I know what I'm doing!"
            } else {
                "Whoa, chill out!"
            }
        } else if question(&chars) {
            "Sure."
        } else {
            "Whatever."
        }
    }
}
