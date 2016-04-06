package items;

import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.util.Collection;
import java.util.concurrent.ConcurrentHashMap;

public class DummyItemRepository implements ItemRepository {
	private final ConcurrentHashMap<String, Item> items = new ConcurrentHashMap<String, Item>();

	DummyItemRepository() {
		
		Item temp = new Item("1", "Folie", "Accesorii",
				"images/folie.jpg", 69, 1);
		temp.addComments(new Comment("gigi", "bla"));
		temp.addComments(new Comment("kat", "nu ca bla"));
		this.items.put("1", temp);
		 
		temp = new Item("2", "LG Nexus", "Smart Phone", "images/nexus.jpg", 1504,
				1);
		temp.addComments(new Comment("nic", "de ce am cumparat IPhone?"));
		this.items.put("2", temp);
		
		this.items.put("3", new Item("3", "Car Kit Bluetooth", "Accesorii",
				"images/carkit.jpg", 199, 1));
		
		this.items.put("4", new Item("4", "Mouse", "Accesorii",
				"images/moue.jpg", 349, 1));
		
		this.items.put("5", new Item("5", "Tab Yoga 3 Pro", "Tablete",
				"images/tableta.jpg", 2699, 1));
	}

	public void writeToFile() {
		File file = new File("itemsByteFile.out");
		ObjectOutputStream output;
		try {
			output = new ObjectOutputStream(new FileOutputStream(file));

			for (Item it : this.items.values()) {
				try {
					output.writeObject(it);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			output.close();
		} catch (Exception e1) {
		}
	}

	public static void main() {
		DummyItemRepository temp = new DummyItemRepository();
		temp.writeToFile();
	}

	@Override
	public void addItem(Item item) {
		items.putIfAbsent(item.getItemId(), item);
	}

	@Override
	public void removeItem(Item item) {
		items.remove(item);
	}

	@Override
	public boolean contains(Item item) {
		return this.items.contains(item);
	}

	@Override
	public Item getItem(String ID) {
		return this.items.get(ID);
	}

	@Override
	public Collection<Item> getItems() {
		return this.items.values();
	}
}
