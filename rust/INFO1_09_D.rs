use std::io::BufRead;

fn main() {
    let reader = std::io::stdin();

    let mut a = Vec::new();
    reader.lock().lines().take(1).for_each(|line| {
        let n = line.unwrap().parse::<usize>().unwrap();
        a = vec![0; n];
    });

    let mut q = 0;
    reader.lock().lines().take(1).for_each(|line| {
        q = line.unwrap().parse::<usize>().unwrap();
    });

    for _ in 0..q {
        let mut c = Vec::new();
        reader.lock().lines().take(2).for_each(|line| {
            c.push(line.unwrap().parse::<usize>().unwrap());
        });

        let l = c[0];
        let r = c[1];
        for i in l..r + 1 {
            a[i] += 1;
        }
    }

    a.iter().for_each(|a| {
        println!("{}", a);
    });
}
