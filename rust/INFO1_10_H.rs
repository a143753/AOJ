use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    reader.lock().lines().take(1).for_each(|line| {
        let t = line.unwrap();
        let a = t.parse::<i32>();

        if a.is_ok() {
            println!("{:?}", a.unwrap() + 1);
        } else {
            println!("{}", t);
        }
    });
}
