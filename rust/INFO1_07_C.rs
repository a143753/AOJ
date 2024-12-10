use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut idt = 0;

    reader.lock().lines().take(1).for_each(|line| {
        idt = line.unwrap().parse::<i32>().unwrap();
    });

    let odt: i32;
    if idt > 0 {
        odt = 1;
    } else if idt == 0 {
        odt = 0;
    } else {
        odt = -1;
    }

    println!("{}", odt);
}
