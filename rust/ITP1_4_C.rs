use std::io::BufRead;
fn main() {
    let mut flag = true;
    std::io::stdin().lock().lines().for_each(|line| {
        if flag {
            let binding = line.unwrap();
            let tmp = binding.trim().split_whitespace().collect::<Vec<_>>();

            let (a, op, b) = (
                tmp[0].parse::<i32>().unwrap(),
                tmp[1],
                tmp[2].parse::<i32>().unwrap(),
            );

            if op == "?" {
                flag = false;
            } else if op == "+" {
                println!("{}", a + b);
            } else if op == "-" {
                println!("{}", a - b);
            } else if op == "*" {
                println!("{}", a * b);
            } else if op == "/" {
                println!("{}", a / b);
            }
        }
    });
}
