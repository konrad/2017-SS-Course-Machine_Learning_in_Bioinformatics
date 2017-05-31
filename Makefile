org_to_pdf:
	#	01-Overview_of_machine_learning_methods.org
	for SLIDE_FILE in  02-SVMs.org ; do \
		emacs $$SLIDE_FILE --batch -f org-beamer-export-to-pdf ; \
	done


download_images:
	mkdir -p images

        # https://dx.doi.org/10.15252/msb.20156651
	wget -c -O images/Angermueller_et_al_2016_Fig_1.jpg \
	   "http://d3dwu2jylmmhzr.cloudfront.net/content/msb/12/7/878/F1.large.jpg?width=800&height=600&carousel=1"

        # https://de.wikipedia.org/wiki/Datei:Cost_per_Genome.png
	wget -c -O images/Cost_per_Genome.png \
	   https://upload.wikimedia.org/wikipedia/commons/0/01/Cost_per_Genome.png

	wget -c -O images/Ben-Hur_Fig_01.png "http://journals.plos.org/ploscompbiol/article/figure/image?size=large&download=&id=10.1371/journal.pcbi.1000173.g001"
	wget -c -O images/Ben-Hur_Fig_02.png "http://journals.plos.org/ploscompbiol/article/figure/image?size=large&download=&id=10.1371/journal.pcbi.1000173.g002"
	wget -c -O images/Ben-Hur_Fig_03.png "http://journals.plos.org/ploscompbiol/article/figure/image?size=large&download=&id=10.1371/journal.pcbi.1000173.g003"
	wget -c -O images/Ben-Hur_Fig_06.png "http://journals.plos.org/ploscompbiol/article/figure/image?size=large&download=&id=10.1371/journal.pcbi.1000173.g006"
	wget -c -O images/Ben-Hur_Fig_07.png "http://journals.plos.org/ploscompbiol/article/figure/image?size=large&download=&id=10.1371/journal.pcbi.1000173.g007"

generate_images:
	python3 scripts/generate_svm_images.py \
	   --output_folder images

download_publications_not_open_access:
	mkdir -p publications

	# https://doi.org/10.1038/nbt1206-1565
	wget -c -O publications/Noble_2006_SVMs.pdf \
	   https://www.nature.com/nbt/journal/v24/n12/pdf/nbt1206-1565.pdf
	# https://doi.org/10.1038/nbt0908-1011
	wget -c -O publications/Kingsford_and_Salzberg_2008_decision_trees.pdf \
	   https://www.nature.com/nbt/journal/v26/n9/pdf/nbt0908-1011.pdf
        # https://doi.org/10.1038/nbt1386
	wget -c -O publications/Krogh_2008_Artificial_neural_networks.pdf \
	   https://www.nature.com/nbt/journal/v26/n2/pdf/nbt1386.pdf

download_publications_open_access:
	wget -c -O publications/Ben-Hur_2008_SVMs.pdf \
          "http://journals.plos.org/ploscompbiol/article/file?id=10.1371/journal.pcbi.1000173&type=printable"

clean:
	rm -f *~ *pdf

