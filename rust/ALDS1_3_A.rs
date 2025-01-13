use std::io::BufRead;

fn read_line_words(reader: &mut std::io::StdinLock) -> Vec<String> {
    let mut buf = String::new();
    reader.read_line(&mut buf).unwrap();
    buf.split_whitespace().map(|x| x.to_string()).collect()
}

fn f(v: Vec<String>) -> i32 {
    let mut stack = Vec::new();

    for x in v {
        match x.as_str() {
            "+" => {
                let a = stack.pop().unwrap();
                let b = stack.pop().unwrap();
                stack.push(a + b);
            }
            "-" => {
                let a = stack.pop().unwrap();
                let b = stack.pop().unwrap();
                stack.push(b - a);
            }
            "*" => {
                let a = stack.pop().unwrap();
                let b = stack.pop().unwrap();
                stack.push(a * b);
            }
            _ => {
                stack.push(x.parse::<i32>().unwrap());
            }
        }
    }
    stack.pop().unwrap()
}

fn main() {
    let reader = std::io::stdin();
    let mut reader = reader.lock();

    let v = read_line_words(&mut reader);

    let a = f(v);

    println!("{}", a);
}
