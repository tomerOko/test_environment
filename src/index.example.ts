type commandType = "initializeDataStracture" | "add" | "contains" | "remove"
type commandValue = [number] | []
type commandsCollection = [Array<commandType>, Array<commandValue>]


class Main{

    public static someProperty;
    public static executable(){
     doSomething()
    }
}

const doSomething = () => {
    console.log("waz'up?")
}



Main.executable()

