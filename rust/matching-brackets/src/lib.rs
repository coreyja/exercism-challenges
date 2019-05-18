use std::collections::HashMap;

fn strip_everything_but_brackets(string: &str) -> String {
    let brackets = vec!['[', ']', '(', ')', '{', '}'];
    string
        .to_string()
        .chars()
        .filter(|x| brackets.contains(x))
        .collect::<String>()
}

fn open_for_close(close: char) -> Option<char> {
    if close == '}' {
        Some('{')
    } else if close == ']' {
        Some('[')
    } else if close == ')' {
        Some('(')
    } else {
        None
    }
}

pub fn brackets_are_balanced(string: &str) -> bool {
    let open_brackets = vec!['[', '(', '{'];

    let stripped = strip_everything_but_brackets(string);
    let mut stack = vec![];

    for c in stripped.chars() {
        if open_brackets.contains(&c) {
            stack.push(c);
        } else {
            let last = stack.last();
            let open = open_for_close(c);

            if last.is_some() && open.is_some() && last.unwrap().clone() == open.unwrap() {
                stack.pop();
            } else {
                return false;
            }
        }
    }

    if stack.len() == 0 {
        true
    } else {
        false
    }
}
