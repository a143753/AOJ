use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut n = 0;
    reader.lock().lines().take(1).for_each(|line| {
        n = line.unwrap().parse::<i32>().unwrap();
    });

    reader
        .lock()
        .lines()
        .take(n as usize)
        .enumerate()
        .for_each(|(i, line)| {
            let l: Vec<_> = line
                .unwrap()
                .split_whitespace()
                .map(|x| x.parse::<i32>().unwrap())
                .collect();

            println!(
                "{}",
                l.iter()
                    .map(|x| (x + i as i32 + 1).to_string())
                    .collect::<Vec<_>>()
                    .join(" ")
            );
        });
}
