#
#   Run this script if all previous steps completed to allow subsequent scripts to detect if the build has failed.
#
echo "##teamcity[setParameter name='env.BUILD_STATE' value='succeeded']"
