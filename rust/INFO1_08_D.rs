use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = 0;

    reader.lock().lines().for_each(|line| {
        idt = line.unwrap().parse::<i32>().unwrap();

        if idt > 0 {
            println!("{}", idt);
        } else if idt < 0 {
        } else {
            return;
        }
    });
}
