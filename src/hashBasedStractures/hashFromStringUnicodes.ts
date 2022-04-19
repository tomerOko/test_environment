
const hashFromStringUnicodes = {
    range:2**16,
    hash: (key : string) : number => {
        let hash = 0;
        if (key.length == 0) return hash;
        for (let i = 0; i < key.length; i++) {
            const char = key.charCodeAt(i);
            hash = ((hash<<1)-hash)+char;
            hash = hash & hash; // Convet to 16bit integer
        }
        return hash;
    }
} 

export default hashFromStringUnicodes
